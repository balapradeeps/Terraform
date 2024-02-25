module "s3-crs-org" {
  source = "./modules/s3-cross-orgin"
  bucketname = "losags-kodai-bake-901"

    tags = {
      Environment = "Dev"
    }
}
