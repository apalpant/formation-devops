Pensez a creer un compte IAM pour laisser le compte Racine faire que la facturation (root).
Les comptes IAM sont des comptes utilisateurs avec des droits (comme sous linux).

https://401827484611.signin.aws.amazon.com/console

{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicRead",
            "Effect": "Allow",
            "Principal": "*",
            "Action": [
                "s3:GetObject",
                "s3:GetObjectVersion"
            ],
            "Resource": "arn:aws:s3:::bucketdalex/j9-tp.pdf"
        }
    ]
}

https://github.com/vanessakovalsky/aws-training

	tp-container


aws configure

/usr/local/bin/aws ecr get-login-password --region eu-west-3 | docker login --username AWS --password-stdin 401827484611.dkr.ecr.eu-west-3.amazonaws.com

docker build -t hello-world-alex .

# docker tag hello-world-alex 401827484611.dkr.ecr.eu-west-3.amazonaws.com/demo-repository(:hello-world-alex ?)   
docker tag hello-world-alex:latest 401827484611.dkr.ecr.eu-west-3.amazonaws.com/demo-repository:latest

Ne pas oublier de creer le repository (Service ECR)

# docker push 401827484611.dkr.ecr.eu-west-3.amazonaws.com/demo-repository(:hello-world-alex ?) 
docker push 401827484611.dkr.ecr.eu-west-3.amazonaws.com/demo-repository:latest

	cloud formation