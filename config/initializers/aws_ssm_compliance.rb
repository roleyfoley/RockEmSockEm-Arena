require "aws-sdk-ssm"
require "logger"

# This manager returns details on the compliance status for an ec2 instance
# WE use this to find out of a competitor is ready to figh
class SSMComplianceManager
  def initialize(client)
    @client = client
    @logger = Logger.new($stdout)
  end

  def is_instance_compliant(instance_id)
    resp = @client.list_resource_compliance_summaries(
      {
        filters: [
          {
            key: "ResourceId",
            type: "EQUAL",
            values: [ instance_id ]
          }
        ]
      }
    )
    resp.resource_compliance_summary_items[0].status == "COMPLIANT"
  end
end

ssm_client = Aws::SSM::Client.new(stub_responses: ENV["AWS_REGION"].nil?)
SSM_COMPLIANCE_MANAGER = SSMComplianceManager.new(ssm_client)
