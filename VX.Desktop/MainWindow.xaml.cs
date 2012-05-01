﻿using System;
using System.Windows.Threading;

namespace VX.Desktop
{
    public partial class MainWindow
    {
        private const int DefaultTimerIntervalMinutes = 15;
        private readonly DispatcherTimer notifyTimer = new DispatcherTimer();

        public MainWindow()
        {
            InitializeComponent();
            InitTimer();
            Hide();
        }

        private void InitTimer()
        {
            notifyTimer.Tick += Notify;
            notifyTimer.Interval = new TimeSpan(0, DefaultTimerIntervalMinutes, 0);
            notifyTimer.Start();
        }

        private void Notify(object sender, EventArgs e)
        {
            taskbarIcon.ShowBalloonTip("VocabExt", "Time to learn English", taskbarIcon.Icon);
        }
    }
}