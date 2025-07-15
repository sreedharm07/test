resource "aws_sqs_queue" "my_queue" {
  content_based_deduplication       = true
  deduplication_scope               = "messageGroup"
  delay_seconds                     = 0
  fifo_queue                        = true
  fifo_throughput_limit             = "perQueue"
  kms_data_key_reuse_period_seconds = 300
  kms_master_key_id                 = null
  max_message_size                  = 262144
  message_retention_seconds         = 345600
  name                              = "dev-test-priority-queue.fifo"
  name_prefix                       = null
  policy                            = null
  receive_wait_time_seconds         = 0
  redrive_allow_policy              = null
  redrive_policy                    = null
  region                            = "ap-south-1"
  sqs_managed_sse_enabled           = true
  tags                              = {
    "team"           = "devops"
  }
  visibility_timeout_seconds        = 1200
}


provider "aws" {
  region = "ap-south-1"
}