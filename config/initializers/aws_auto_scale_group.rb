require "aws-sdk-autoscaling"
require "logger"

# This manager controls the autoscale group we use for the competitors
# It allows for setting the size and controlling scaling
class AutoScalingManager
  attr_reader :name

  def initialize(client, name)
    @client = client
    @logger = Logger.new($stdout)
    @name = name
  end

  def set_desired_capacity(count)
    @client.set_desired_capacity(
      {
        auto_scaling_group_name: @name,
        desired_capacity: count
      }
    )
  end

  def suspend_scaling
    @client.suspend_processes(
      {
        auto_scaling_group_name: @name
      }
    )
  end

  def resume_scaling
    @client.resume_processes(
      {
        auto_scaling_group_name: @name
      }
    )
  end
end

auto_scale_client = Aws::AutoScaling::Client.new(stub_responses: ENV["AWS_REGION"].nil?)
AUTOSCALING_GROUP_MANAGER = AutoScalingManager.new(auto_scale_client, ENV["AUTO_SCALE_GROUP_NAME"])
