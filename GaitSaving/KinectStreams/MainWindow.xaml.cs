using Microsoft.Kinect;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.IO;

//NOTE: THis is the only class we really care about right now.
// I left Extension.cs in the project as we may want to use the functions it has later.
namespace KinectStreams
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        #region Members
        KinectSensor _sensor;
        MultiSourceFrameReader _reader;
        IList<Body> _bodies;
        bool record = false;
        bool snapshot = false;
        bool frontRecord = false;
        //string subjectID = "MaxTesting10-20";
        string subjectID;
        bool changedID = false;
        #endregion

        #region Constructor

        public MainWindow()
        {
            InitializeComponent();
        }

        #endregion

        #region Window Events

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            _sensor = KinectSensor.GetDefault();

            if (_sensor != null)
            {
                _sensor.Open();

                _reader = _sensor.OpenMultiSourceFrameReader(FrameSourceTypes.Color | FrameSourceTypes.Depth | FrameSourceTypes.Infrared | FrameSourceTypes.Body);
                _reader.MultiSourceFrameArrived += Reader_MultiSourceFrameArrived;
            }
        }

        private void Window_Closed(object sender, EventArgs e)
        {
            if (_reader != null)
            {
                _reader.Dispose();
            }

            if (_sensor != null)
            {
                _sensor.Close();
            }
        }
        #endregion

        void Reader_MultiSourceFrameArrived(object sender, MultiSourceFrameArrivedEventArgs e)
        {
            var reference = e.FrameReference.AcquireFrame();
            #region Color, depth, and infrard capture
            // Color
            using (var frame = reference.ColorFrameReference.AcquireFrame())
            {
                if (frame != null)
                {
                    camera.Source = frame.ToBitmap();
                }
            }
            #endregion
            // Body
            using (var frame = reference.BodyFrameReference.AcquireFrame())
            {
                if (frame != null)
                {
                    canvas.Children.Clear();

                    _bodies = new Body[frame.BodyFrameSource.BodyCount];

                    frame.GetAndRefreshBodyData(_bodies);

                    foreach (var body in _bodies)
                    {
                        if (body != null)
                        {
                            if (body.IsTracked)
                            {
                                Point point = new Point();
                                foreach (Joint joint in body.Joints.Values)
                                {
                                    if (joint.TrackingState == TrackingState.Tracked)
                                    {
                                       //get color point and make sure it's not infinity
                                        ColorSpacePoint colorPoint = _sensor.CoordinateMapper.MapCameraPointToColorSpace(joint.Position);
                                        point.X = float.IsInfinity(colorPoint.X) ? 0 : colorPoint.X;
                                        point.Y = float.IsInfinity(colorPoint.Y) ? 0 : colorPoint.Y;

                                        //create ellipse to draw on screen
                                        Ellipse ellipse = new Ellipse
                                        {
                                            Width = 15,
                                            Height = 15,
                                            Fill = new SolidColorBrush(Colors.DarkRed)
                                        };
                                        //draw to screen
                                        Canvas.SetLeft(ellipse, point.X - ellipse.Width * 2);
                                        Canvas.SetTop(ellipse, point.Y - ellipse.Height * 2);
                                        canvas.Children.Add(ellipse);
                                    }
                                }
                                if(record && !frontRecord)
                                {
                                    //if record button is pressed, record gait
                                    RecordGait(body);
                                }
                                if(frontRecord && !record)
                                {
                                    RecordForward(body);
                                }
                                if(snapshot && !record && !frontRecord)
                                {
                                    RecordSnap(body);
                                }
                            }
                        }
                    }
                }
            }
        }
        #region Recording Functions
        private void RecordGait(Body body)
        {

            string path = @"../../../OutputData/SideViews/" + subjectID + ".csv";
            var jointList = Enum.GetValues(typeof(JointType)).Cast<JointType>();
            int[] subset = new int[] { 2, 3, 4, 5, 6, 7, 12, 13, 14, 15, 21 };
            using (StreamWriter sw = File.AppendText(path))
            {
                sw.NewLine = "";
                foreach (int i in subset)
                {
                    var p = (JointType)i;
                    sw.WriteLine(body.Joints[p].Position.X + "," + body.Joints[p].Position.Y + ","
                        /*+ body.Joints[i].Position.Z + ","*/
                        );
                }
                sw.WriteLine(DateTime.Now.Ticks);
                sw.WriteLine("\r\n");
            }
        }
        private void RecordForward(Body body)
        {

            string path3 = @"../../../OutputData/FrontViews/Dynamic/" + subjectID + ".csv";
            var jointList = Enum.GetValues(typeof(JointType)).Cast<JointType>();
            int[] subset = new int[] { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23 };
            using (StreamWriter sw = File.AppendText(path3))
            {
                sw.NewLine = "";
                foreach (int i in subset)
                {
                    var p = (JointType)i;
                    sw.WriteLine(body.Joints[p].Position.X + "," + body.Joints[p].Position.Y + "," + body.Joints[p].Position.Z + ",");
                }
                sw.WriteLine(body.Joints[(JointType)24].Position.X + "," + body.Joints[(JointType)24].Position.Y + "," + body.Joints[(JointType)24].Position.Z);
                sw.WriteLine("\r\n");
            }
        }
        private void RecordSnap(Body body)
        {
            string path2 = @"../../../OutputData/FrontViews/Static/" + subjectID + ".csv";
            var jointList = Enum.GetValues(typeof(JointType)).Cast<JointType>();
            int[] subset = new int[] { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23 };
            using (StreamWriter sw = File.AppendText(path2))
            {
                sw.NewLine = "";
                foreach (int i in subset)
                {
                    var p = (JointType)i;
                    sw.WriteLine(body.Joints[p].Position.X + "," + body.Joints[p].Position.Y + "," + body.Joints[p].Position.Z + ",");
                }
                sw.WriteLine(body.Joints[(JointType)24].Position.X + "," + body.Joints[(JointType)24].Position.Y + "," + body.Joints[(JointType)24].Position.Z);
                //sw.WriteLine("\r\n");
            }
            snapshot = false;
            br.Fill = new SolidColorBrush(Color.FromRgb(0, 0, 255));
        }
        private void StartRecord(object sender, RoutedEventArgs e)
        {
            if (!changedID)
            {
                return;
            }
            record = true;
            if (!frontRecord)
            {
                rb.Fill = new SolidColorBrush(Color.FromRgb(255, 0, 0));
            }
            else
            {
                rb.Fill = new SolidColorBrush(Color.FromRgb(255, 153, 0));
                rr.Fill = new SolidColorBrush(Color.FromRgb(255, 153, 0));
            }
            
        }

        private void StopRecord(object sender, RoutedEventArgs e)
        {
            if (!changedID)
            {
                return;
            }
            record = false;
            rb.Fill = new SolidColorBrush(Color.FromRgb(0, 0, 0));
        }
        private void FrontSnapshot(object sender, RoutedEventArgs e)
        {
            if (!changedID)
            {
                return;
            }
            snapshot = true;
            br.Fill = new SolidColorBrush(Color.FromRgb(0, 255, 0));
        }
        private void StartFrontRecord(object sender, RoutedEventArgs e)
        {
            if (!changedID)
            {
                return;
            }
            frontRecord = true;
            if (!record)
            {
                rr.Fill = new SolidColorBrush(Color.FromRgb(255, 0, 0));
            }
            else
            {
                rr.Fill = new SolidColorBrush(Color.FromRgb(255, 153, 0));
                rb.Fill = new SolidColorBrush(Color.FromRgb(255, 153, 0));
            }
            
        }

        private void StopFrontRecord(object sender, RoutedEventArgs e)
        {
            if (!changedID)
            {
                return;
            }
            frontRecord = false;
            rr.Fill = new SolidColorBrush(Color.FromRgb(0, 0, 0));
        }

        private void saveSubjectID(object sender, RoutedEventArgs e)
        {
            subjectID = subjectInput.Text;
            changedID = true;
            this.Title = "FRI - Kinect Gait Recording: " + subjectID;
        }

        private void SelectAddress(object sender, RoutedEventArgs e)
        {
            TextBox tb = (sender as TextBox);
            if (tb != null)
            {
                tb.SelectAll();
            }
        }

        private void SelectivelyIgnoreMouseButton(object sender,
            MouseButtonEventArgs e)
        {
            TextBox tb = (sender as TextBox);
            if (tb != null)
            {
                if (!tb.IsKeyboardFocusWithin)
                {
                    e.Handled = true;
                    tb.Focus();
                }
            }
        }
        #endregion
    }
}
