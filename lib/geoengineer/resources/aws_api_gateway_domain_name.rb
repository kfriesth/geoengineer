########################################################################
# AwsCloudTrail is the +aws_api_gateway_domain_name+ terrform resource,
#
# {https://www.terraform.io/docs/providers/aws/r/aws_api_gateway_domain_name.html}
########################################################################
class GeoEngineer::Resources::AwsApiGatewayDomainName < GeoEngineer::Resource
  validate -> { validate_required_attributes([
                :domain_name,
                :certificate_name,
                :certificate_body,
                :certificate_chain,
                :certificate_private_key
            ]) }

  after :initialize, -> { _terraform_id -> { nil } }
  after :initialize, -> { _geo_id -> { rand(36**20).to_s(36) } }

  def support_tags?
    false
  end
end

