resource "aws_sqs_queue" "checkout_events_dlq" {
  name                      = "checkout-events-dlq"
  delay_seconds             = 90
  max_message_size          = 2048
  message_retention_seconds = 86400
  receive_wait_time_seconds = 10

  tags = {
    Environment = "dev"
  }
}

resource "aws_sqs_queue" "checkout_events" {
  name                      = "checkout-events"
  delay_seconds             = 90
  max_message_size          = 2048
  message_retention_seconds = 86400
  receive_wait_time_seconds = 10
  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.checkout_events_dlq.arn
    maxReceiveCount     = 4
  })

  tags = {
    Environment = "dev"
  }
}