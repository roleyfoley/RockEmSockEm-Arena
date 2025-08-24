# Create new competitors based on changes to their compliance status from SSM
# Event Schema expected
# {
#  "version": "0",
#  "id": "01234567-0123-0123-0123-012345678901",
#  "detail-type": "Configuration Compliance State Change",
#  "source": "aws.ssm",
#  "account": "123456789012",
#  "time": "2024-07-17T19:02:31Z",
#  "region": "us-east-2",
#  "resources": [
#    "arn:aws:ssm:us-east-2:123456789012:managed-instance/i-01234567890abcdef"
#  ],
#  "detail": {
#    "resource-type": "managed-instance",
#    "resource-id": "i-01234567890abcdef",
#    "compliance-status": "non_compliant",
#    "compliance-type": "Patch",
#    "patch-baseline-id": "PB789",
#    "severity": "critical"
#  }
# }
module ComplianceLambdaFunction
  class Handler
    def self.process(event:, context:)
      if event.detail-type == "Configuration Compliance State Change"
        competitor = Competitor.find_or_create_by(instance_id: event.detail.resource-id)

      end
    end
  end
end
