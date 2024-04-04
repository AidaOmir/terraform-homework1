
provider "aws" {
  region = "us-east-1" 
}

resource "aws_iam_user" "blackpink_users" {
  count = 4
  name  = element(["jenny", "rose", "lisa", "jisoo"], count.index)
}

resource "aws_iam_user" "twice_users" {
  count = 4
  name  = element(["jihyo", "sana", "momo", "dahyun"], count.index)
}


resource "aws_iam_group" "blackpink_group" {
  name = "blackpink"
}

resource "aws_iam_group" "twice_group" {
  name = "twice"
}

resource "aws_iam_group_membership" "team" {
  name = "tf-testing-group-membership"

  users = [for user in aws_iam_user.blackpink_users : user.name]
  group = aws_iam_group.blackpink_group.name
}


  resource "aws_iam_group_membership" "team1" {
  name = "tf-testing-group-membership"

  users = [for user in aws_iam_user.twice_users : user.name]
  group = aws_iam_group.twice_group.name
}

resource "aws_iam_user" "miyeon" {
    name = "miyeon"
}
resource "aws_iam_user" "mina" {
    name = "mina"
}

resource "aws_iam_group_membership" "blackpink" {
  name = "blackpink"
  users = [aws_iam_user.miyeon.name]
  group = aws_iam_group.blackpink_group.name
}

resource "aws_iam_group_membership" "twice" {
  name = "twice"
  users = [aws_iam_user.mina.name]
  group = aws_iam_group.twice_group.name
}
