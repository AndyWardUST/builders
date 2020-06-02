FROM registry.access.redhat.com/rhel7/rhel

RUN yum-config-manager --enable rhel-server-rhscl-7-rpms rhel-7-server-extras-rpms rhel-7-server-dotnet-rpms 

RUN rpm -i https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

RUN curl https://packages.microsoft.com/config/rhel/7/prod.repo | tee /etc/yum.repos.d/microsoft.repo

RUN yum -y install ca-certificates \
        curl \
        libicu \
	java-11-openjdk-devel \
        jq \
	nmap-ncat \
	powershell \
	rh-dotnet30 \
	sudo \
        zip \
        unzip

WORKDIR /azp

COPY ./gitcreate.sh .
COPY ./start.sh .
RUN chmod +x gitcreate.sh
RUN chmod +x start.sh
RUN ./gitcreate.sh
RUN useradd agent
RUN chown -R agent:agent /azp
USER agent

CMD ["./start.sh"]
