module "network" {
  source = "./modules/network"
  vpc_name = "dos_15_makhniou_vpc"
  vpc_cidr = "10.0.0.0/16"
  availability_zones   = "us-east-1a"
  public_subnet_cidr  = "10.0.0.0/27"
  private_subnet_cidr = "10.0.0.32/27"
  enable_dns_hostnames = true
  enable_dns_support   = true
}

module "jenkins_master_security" {
  source = "./modules/security"
  name = "dos_15_makhniou_jenkins_m_sg"
  vpc_id = module.network.vpc_id
  ingress = [
   {
    from_port   = 2123
    to_port     = 2123
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
   },
   {
    from_port  = 8183
    to_port    = 8183
    protocol   = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    }
  ]

  egress = [
   {
      from_port  = 0
      to_port    = 0
      protocol   = "-1"
      cidr_blocks = ["0.0.0.0/0"]
   }
  ]
}

module "jenkins_agent_security" {
  source = "./modules/security"
  name = "dos_15_makhniou_jenkins_s_sg"
  vpc_id = module.network.vpc_id
  ingress = [
   {
    from_port   = 2124
    to_port     = 2124
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
   },
   {
      description = "Allow http from everywhere"
      from_port  = 1337
      to_port    = 1337
      protocol   = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]

  egress = [
   {
      description = "Allow outgoing traffic"
      from_port  = 0
      to_port    = 0
      protocol   = "-1"
      cidr_blocks = ["0.0.0.0/0"]
   }
  ] 
}

module "jenkins_master" {
  source = "./modules/compute"
  name = "dos_15_makhniou_master"
  instance_type = "t2.micro"
  key_name = "DOS_15_Makhniou"
  subnet_id = module.network.public_subnet_id
  security_group_id = module.jenkins_master_security.security_group_id
  public_ip_address = true
  user_data = "${file("./script/jenkins_master.sh")}"

}

module "jenkins_agent" {
  source = "./modules/compute"
  name = "dos_15_makhniou_agent"
  instance_type = "t2.micro"
  key_name = "DOS_15_Makhniou"
  subnet_id = module.network.public_subnet_id
  security_group_id = module.jenkins_agent_security.security_group_id
  public_ip_address = true
  user_data = "${file("./script/jenkins_agent.sh")}"

}
