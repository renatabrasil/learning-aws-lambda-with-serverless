resource "aws_cloudwatch_event_bus" "checkout-bus" {
  name = "checkout-bus"
}

resource "aws_cloudwatch_event_rule" "checkout-rule" {
  name        = "capture-checkout-events"
  description = "Capture all checkout events"

  event_pattern = <<PATTERN
{
  "source": [
    "aws.lambda"
  ],
  "detail-type": [
    data:
  ]
}
PATTERN
}

resource "aws_cloudwatch_event_target" "checkout-sqs" {
  target_id = "Yada"


  run_command_targets {
    key    = "tag:Name"
    values = ["FooBar"]
  }

  run_command_targets {
    key    = "InstanceIds"
    values = ["i-162058cd308bffec2"]
  }
}