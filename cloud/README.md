# Learning Computing Overview

- [Learning Computing Overview](#learning-computing-overview)
  - [How Do We Know If Something Is in the Cloud?](#how-do-we-know-if-something-is-in-the-cloud)
  - [Differences Between On-Premises and Cloud](#differences-between-on-premises-and-cloud)
  - [Cloud Deployment Models](#cloud-deployment-models)
    - [1. Private Cloud](#1-private-cloud)
    - [2. Public Cloud](#2-public-cloud)
    - [3. Hybrid Cloud](#3-hybrid-cloud)
    - [4. Multi-Cloud](#4-multi-cloud)
  - [Types of Cloud Services](#types-of-cloud-services)
    - [Infrastructure as a Service (IaaS)](#infrastructure-as-a-service-iaas)
    - [Platform as a Service (PaaS)](#platform-as-a-service-paas)
    - [Software as a Service (SaaS)](#software-as-a-service-saas)
  - [Advantages and Disadvantages of the Cloud](#advantages-and-disadvantages-of-the-cloud)
    - [Advantages](#advantages)
    - [Disadvantages](#disadvantages)
  - [OpEx vs. CapEx in Cloud Computing](#opex-vs-capex-in-cloud-computing)
    - [Relation to Cloud](#relation-to-cloud)
  - [Is Migrating to the Cloud Always Cheaper?](#is-migrating-to-the-cloud-always-cheaper)
  - [Cloud Market Share Breakdown](#cloud-market-share-breakdown)
  - [Top 3 Cloud Providers and Their Popularity](#top-3-cloud-providers-and-their-popularity)
    - [Amazon Web Services (AWS)](#amazon-web-services-aws)
    - [Microsoft Azure](#microsoft-azure)
    - [Google Cloud Platform (GCP)](#google-cloud-platform-gcp)
  - [Which Cloud Provider Is the Best?](#which-cloud-provider-is-the-best)
  - [Costs Associated with Using the Cloud](#costs-associated-with-using-the-cloud)
  - [The Four Pillars of DevOps](#the-four-pillars-of-devops)
    - [1. Culture](#1-culture)
    - [2. Automation](#2-automation)
    - [3. Measurement](#3-measurement)
    - [4. Sharing](#4-sharing)


## How Do We Know If Something Is in the Cloud?

An application or service is considered **"in the cloud"** if it is delivered over the internet, on-demand, centrally managed and relies on remote servers hosted in data centers.

## Differences Between On-Premises and Cloud

| Aspect            | On-Premises                              | Cloud                                    |
|-------------------|------------------------------------------|------------------------------------------|
| **Infrastructure**| Owned and maintained by the organization | Provided and managed by cloud providers  |
| **Scalability**   | Limited by physical hardware             | Virtually unlimited, on-demand           |
| **Cost Model**    | Capital Expenditure (CapEx)              | Operational Expenditure (OpEx)           |
| **Maintenance**   | Handled internally                       | Managed by provider                      |
| **Accessibility** | Local network                            | Accessible over the internet             |

## Cloud Deployment Models

### 1. Private Cloud

**Definition**: Cloud infrastructure dedicated to a single organization.

**Characteristics**:
* Enhanced security and control.
* Can be on-premises or hosted externally.
* Dedicated to an organisation - inaccessible by the public.

### 2. Public Cloud

**Definition**: Services offered over the public internet and shared among multiple organizations.

**Characteristics**:
* Cost-effective due to shared resources.
* Managed by third-party providers.

### 3. Hybrid Cloud

**Definition**: Combines private/on-prem and public clouds, allowing data and applications to be shared between them.

**Characteristics**:
* Flexibility and scalability.
* Balance between control/security and cost.
* Some industries/organisations are regulated and need to store sensitive info on-prem.

### 4. Multi-Cloud

**Definition**: Utilization of multiple cloud services from different providers.

**Characteristics**:
* Avoids vendor lock-in. Back-ups to avoid redundancy and enable cloud provider switch.
* Leverages best services from each provider.

## Types of Cloud Services

### Infrastructure as a Service (IaaS)

* **Provides**: Virtualized computing resources over the internet.
* **User Manages**: Operating systems, applications, data.
* **Examples**: AWS EC2, Google Compute Engine.

### Platform as a Service (PaaS)

* **Provides**: Hardware and software tools for application development.
* **User Manages**: Applications and data.
* **Examples**: Heroku, Google App Engine.

### Software as a Service (SaaS)

* **Provides**: Software applications over the internet.
* **User Manages**: Only the use of the application.
* **Examples**: Salesforce, Microsoft Office 365.

## Advantages and Disadvantages of the Cloud

### Advantages

* **Cost Efficiency**: Reduces the need for upfront capital expenses.
* **Scalability**: Easily adjust resources to meet demand.
* **Accessibility**: Access services from anywhere with an internet connection.
* **Disaster Recovery**: Enhanced backup and recovery options.
* **Automatic Updates**: Providers handle maintenance and updates.
* **Guaranteed Level of Service**: With bigger cloud providers.

### Disadvantages

* **Security Risks**: Potential vulnerabilities and data breaches.
* **Downtime**: Dependence on internet connectivity.
* **Limited Control**: Less customization of underlying infrastructure.
* **Vendor Lock-In**: Challenges in migrating between providers.
* **Ongoing Costs**: Continuous operational expenses.

## OpEx vs. CapEx in Cloud Computing

* **Capital Expenditure (CapEx)**: Upfront costs for physical assets.
  *Example*: Purchasing servers.
* **Operational Expenditure (OpEx)**: Ongoing expenses for services.
  *Example*: Monthly cloud service fees.

### Relation to Cloud

* **Cloud Services**: Typically fall under OpEx.
* **On-Premises**: Involves CapEx for infrastructure investments.

## Is Migrating to the Cloud Always Cheaper?

Not always. While the cloud can reduce capital expenses, factors such as the below, can lead to higher overall costs. It's essential to perform a thorough cost-benefit analysis before migrating.
* **Migration Costs**
* **Long-term Operational Expenses**
* **Complex Pricing Models** 



## Cloud Market Share Breakdown

As of 2023:
* **Amazon Web Services (AWS)**: **32%**
* **Microsoft Azure**: **23%**
* **Google Cloud Platform (GCP)**: **10%**
* **Others**: **35%**

## Top 3 Cloud Providers and Their Popularity

### Amazon Web Services (AWS)

**Strengths**:
* Extensive range of services.
* Early market entry and maturity.
* Global infrastructure.
* Cheapest VMs out of the big 3.
* Excellent documentation.

### Microsoft Azure

**Strengths**:
* Seamless integration with Microsoft products.
* Strong enterprise presence.
* Hybrid cloud capabilities.

### Google Cloud Platform (GCP)

**Strengths**:
* Expertise in data analytics and machine learning.
* Competitive pricing.
* Innovative services.

## Which Cloud Provider Is the Best?

The best provider depends on your specific needs:
* **AWS**: Best for a wide variety of services and global reach.
* **Azure**: Ideal for Microsoft-centric organizations.
* **GCP**: Excels in data analytics and AI solutions.

**Recommendation**: Assess your business requirements, existing infrastructure, and goals to choose the most suitable provider.

## Costs Associated with Using the Cloud

* **Compute Resources**: Virtual machines, containers.
* **Storage**: Data storage solutions.
* **Networking**: Bandwidth, load balancers.
* **Databases**: Managed database services.
* **Data Transfer**: Ingress (not charged) and egress (traffic) charges.
* **Security Services**: Firewalls, encryption.
* **Management Tools**: Monitoring and analytics.
* **Support Services**: Technical support plans.

## The Four Pillars of DevOps

### 1. Culture

* **Emphasis**: Collaboration and communication between teams.
* **Cloud Link**: Shared environments and tools enhance collaboration.

### 2. Automation

* **Emphasis**: Automating repetitive tasks.
* **Cloud Link**: Infrastructure as Code (IaC) automates resource provisioning.

### 3. Measurement

* **Emphasis**: Tracking performance and progress.
* **Cloud Link**: Cloud services offer robust monitoring tools.

### 4. Sharing

* **Emphasis**: Knowledge sharing and transparency.
* **Cloud Link**: Centralized platforms facilitate sharing code and configurations.

* **Integration with Cloud**: Cloud platforms provide the tools and environments that support DevOps practices, enabling faster deployment cycles and improved efficiency.