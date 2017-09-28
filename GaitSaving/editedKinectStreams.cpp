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

//Trying to make code gather raw point data rather than KinectStreams process data.


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
                                    }
                                }
                                if(record)
                                {
                                    //if record button is pressed, record gait
                                    RecordGait(body);
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
            string path = @"../../../OutputData/test.csv";
            var jointList = Enum.GetValues(typeof(JointType)).Cast<JointType>();
            using (StreamWriter sw = File.AppendText(path))
            {
                sw.NewLine = "";
                foreach (var i in jointList)
                {
                    sw.WriteLine(body.Joints[i].Position.X + "," + body.Joints[i].Position.Y + ",");
                }
                sw.WriteLine(DateTime.Now.Ticks);
                sw.WriteLine("\r\n");
            }
        }
        private void StartRecord(object sender, RoutedEventArgs e)
        {
            record = true;
            rb.Fill = new SolidColorBrush(Color.FromRgb(255, 0, 0));
        }

        private void StopRecord(object sender, RoutedEventArgs e)
        {
            record = false;
            rb.Fill = new SolidColorBrush(Color.FromRgb(0, 0, 0));
        }
        #endregion
    }
}
