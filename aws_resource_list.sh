####### Author: Rohith Dubba
# Version: V 0.0.1
#
#
#
#
#
#
#  
#
    # Check if required number of arguments are passed
    #
    if [ $# -ne 2 ]; then
       echo " Usage: ./aws_resource_list.sh <aws_region> <aws_service>"
       echo " Example: ./aws_resource_list.sh us-east-1 ec2"
       exit 1
    fi

    # Assign the arguments to variables and convert the service to lowercase
    #
    aws_region=$1
    aws_service=$2

    # check if aws cli is installed
    #
    if ! command -v aws &> /dev/null; then
	    echo "AWS CLI is not Installed"
	    exit 1
    fi

    #check if AWS CLI is configured
    #
    if [ ! -d ~/.aws ] ; then
	    
	    echo "aws cli is not configured"
	    exit 1
    fi

    # List the resources based on the service
    #
    case $2 in
     ec2)
     echo "Listing ec2 instances in the region $1"
      aws ec2 describe-instances --region $1
      ;;
     s3)
     echo "Listing s3 buckets in the region $1"
      aws s3api list-buckets --region $1
      ;;
     RDS)
     echo "aws rds describe-db-instances --region $1"
     aws dynamodb list-tables --region $1
     ;;  
     Lambda)
     echo " listing lambda functions in the region $1"
     aws lambda list-functions --region $1    
     ;;
      *) 
      echo "The selected service is not supported for listing"
      ;;
    esac
