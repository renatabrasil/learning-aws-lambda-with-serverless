resource "aws_dynamodb_table" "productsdb" {
  name           = "Products"
  billing_mode   = "PROVISIONED"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "id"
  range_key      = "name"

  attribute {
    name = "id"
    type = "S"
  }

  attribute {
    name = "name"
    type = "S"
  }

  #  ttl {
  #    attribute_name = "TimeToExist"
  #    enabled        = false
  #  }

  #  global_secondary_index {
  #    name               = "GameTitleIndex"
  #    hash_key           = "GameTitle"
  #    range_key          = "TopScore"
  #    write_capacity     = 10
  #    read_capacity      = 10
  #    projection_type    = "INCLUDE"
  #    non_key_attributes = ["UserId"]
  #  }

  tags = {
    Name        = "dynamodb-table-products"
    Environment = "dev"
  }
}


resource "aws_dynamodb_table" "basketdb" {
  name           = "Baskets"
  billing_mode   = "PROVISIONED"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "userName"

  attribute {
    name = "userName"
    type = "S"
  }

  #  global_secondary_index {
  #    name               = "GameTitleIndex"
  #    hash_key           = "GameTitle"
  #    range_key          = "TopScore"
  #    write_capacity     = 10
  #    read_capacity      = 10
  #    projection_type    = "INCLUDE"
  #    non_key_attributes = ["UserId"]
  #  }

  tags = {
    Name        = "dynamodb-table-baskets"
    Environment = "dev"
  }
}