# AWS Monitoring, Alert Management, Autoscaling

## Monitoring 

![alt text](images/monitoring.png)

### Load testing with Apache Bench

Install ApacheBench:

> sudo apt-get install apache2-utils

Format for ab command:

> ab -n [number of requests] -c [concurrency] http://yourwebsite.com/

This command will show the response times for various requests and this can help determine if your page meets any requirement to speed you may have. 

![alt text](images/ab-console.png)

This shows the dashboard and the CPU ultilization section with spikes where the ab command has been used.

![alt text](images/dashboard.png)

![alt text](images/cpu.png)

## Alarms

### Creating the alarm

To create an alarm a metric needs to be set, for this instance a `CPU_UTILIZATION` metric was used which could be found under EC2 metrics. Here the statistic (`Average`) and period (`1 minute`) are also set. 

Below that the conditions can be entered which determine how and when an alarm is triggered. For this example a percentage of `20` was selected with the condition being greater than this threshold. `Static` indicates that a value is used for the threshold. 

![alt text](images/metric.png)

Once the conditions are in place the `SNS (Simple Notification Service) Topic` needs to be created, this simply requires a suitable name (`tech601-jason-alarm`) and the email for the notification to be sent to. Upon creation of this there will be a following subscription email with a link to confirm the subscription, without this being confirmed no notifications will come through.

![alt text](images/create-alarm.png)

### Email Notifications

![alt text](images/subscription.png)

When the alarm is triggered an email notification is sent, this contains all the details including the alarm details, threshold, monitored metric, and state change actions.

![alt text](images/alarm.png)