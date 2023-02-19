import aws_cdk as cdk
from constructs import Construct

import aws_cdk.aws_ecs as ecs
import aws_cdk.aws_ecs_patterns as ecsp


class CdkEcsStack(cdk.Stack):

    def __init__(self, scope: Construct, construct_id: str, **kwargs) -> None:
        super().__init__(scope, construct_id, **kwargs)

        ecsp.ApplicationLoadBalancedFargateService(self, "knoxcdkweb",
                                                   task_image_options=ecsp.ApplicationLoadBalancedTaskImageOptions(
                                                       image=ecs.ContainerImage.from_registry("531517645343.dkr.ecr.us-east-2.amazonaws.com/knoxweb:latest")),
                                                   public_load_balancer=True
                                                   )
