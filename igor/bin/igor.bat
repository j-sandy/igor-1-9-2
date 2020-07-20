@rem
@rem Copyright 2015 the original author or authors.
@rem
@rem Licensed under the Apache License, Version 2.0 (the "License");
@rem you may not use this file except in compliance with the License.
@rem You may obtain a copy of the License at
@rem
@rem      http://www.apache.org/licenses/LICENSE-2.0
@rem
@rem Unless required by applicable law or agreed to in writing, software
@rem distributed under the License is distributed on an "AS IS" BASIS,
@rem WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
@rem See the License for the specific language governing permissions and
@rem limitations under the License.
@rem

@if "%DEBUG%" == "" @echo off
@rem ##########################################################################
@rem
@rem  igor startup script for Windows
@rem
@rem ##########################################################################

@rem Set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" setlocal

set DIRNAME=%~dp0
if "%DIRNAME%" == "" set DIRNAME=.
set APP_BASE_NAME=%~n0
set APP_HOME=%DIRNAME%..

@rem Add default JVM options here. You can also use JAVA_OPTS and IGOR_OPTS to pass JVM options to this script.
set DEFAULT_JVM_OPTS="-Djava.security.egd=file:/dev/./urandom" "-Dspring.config.additional-location=/opt/spinnaker/config/"

@rem Find java.exe
if defined JAVA_HOME goto findJavaFromJavaHome

set JAVA_EXE=java.exe
%JAVA_EXE% -version >NUL 2>&1
if "%ERRORLEVEL%" == "0" goto init

echo.
echo ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:findJavaFromJavaHome
set JAVA_HOME=%JAVA_HOME:"=%
set JAVA_EXE=%JAVA_HOME%/bin/java.exe

if exist "%JAVA_EXE%" goto init

echo.
echo ERROR: JAVA_HOME is set to an invalid directory: %JAVA_HOME%
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:init
@rem Get command-line arguments, handling Windows variants

if not "%OS%" == "Windows_NT" goto win9xME_args

:win9xME_args
@rem Slurp the command line arguments.
set CMD_LINE_ARGS=
set _SKIP=2

:win9xME_args_slurp
if "x%~1" == "x" goto execute

set CMD_LINE_ARGS=%*

:execute
@rem Setup the command line

set CLASSPATH=%APP_HOME%\config;%APP_HOME%\lib\igor-web.jar;%APP_HOME%\lib\igor-monitor-artifactory.jar;%APP_HOME%\lib\igor-core.jar;%APP_HOME%\lib\fiat-api-1.14.0.jar;%APP_HOME%\lib\kork-dynomite-7.26.0-SNAPSHOT.jar;%APP_HOME%\lib\kork-jedis-7.26.0-SNAPSHOT.jar;%APP_HOME%\lib\kork-web-7.26.0-SNAPSHOT.jar;%APP_HOME%\lib\kork-security-7.26.0-SNAPSHOT.jar;%APP_HOME%\lib\kork-core-7.26.0-SNAPSHOT.jar;%APP_HOME%\lib\kork-config-7.26.0-SNAPSHOT.jar;%APP_HOME%\lib\kork-secrets-aws-7.26.0-SNAPSHOT.jar;%APP_HOME%\lib\kork-secrets-gcp-7.26.0-SNAPSHOT.jar;%APP_HOME%\lib\kork-secrets-7.26.0-SNAPSHOT.jar;%APP_HOME%\lib\spring-cloud-config-server-2.1.3.RELEASE.jar;%APP_HOME%\lib\spring-boot-starter-actuator-2.2.7.RELEASE.jar;%APP_HOME%\lib\logstash-logback-encoder-4.11.jar;%APP_HOME%\lib\kork-hystrix-7.26.0-SNAPSHOT.jar;%APP_HOME%\lib\fiat-core-1.14.0.jar;%APP_HOME%\lib\spring-boot-properties-migrator-2.2.7.RELEASE.jar;%APP_HOME%\lib\spring-boot-starter-web-2.2.7.RELEASE.jar;%APP_HOME%\lib\jaxb-api-2.3.1.jar;%APP_HOME%\lib\jaxb-core-2.3.0.1.jar;%APP_HOME%\lib\jaxb-impl-2.3.2.jar;%APP_HOME%\lib\jackson-dataformat-xml-2.10.2.jar;%APP_HOME%\lib\dyno-jedis-1.7.2.jar;%APP_HOME%\lib\dyno-contrib-1.7.2.jar;%APP_HOME%\lib\eureka-client-1.9.18.jar;%APP_HOME%\lib\artifactory-java-client-services-2.8.1.jar;%APP_HOME%\lib\jackson-module-jaxb-annotations-2.10.2.jar;%APP_HOME%\lib\netflix-eventbus-0.3.0.jar;%APP_HOME%\lib\hystrix-javanica-1.5.18.jar;%APP_HOME%\lib\hystrix-core-1.5.18.jar;%APP_HOME%\lib\archaius-core-0.7.6.jar;%APP_HOME%\lib\converter-jackson-1.9.0.jar;%APP_HOME%\lib\kork-artifacts-7.26.0-SNAPSHOT.jar;%APP_HOME%\lib\spring-boot-actuator-autoconfigure-2.2.7.RELEASE.jar;%APP_HOME%\lib\spring-boot-starter-json-2.2.7.RELEASE.jar;%APP_HOME%\lib\aws-java-sdk-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-codestarconnections-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-detective-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-kinesisvideosignalingchannels-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-ebs-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-augmentedairuntime-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-outposts-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-codeguruprofiler-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-codegurureviewer-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-frauddetector-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-kendra-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-networkmanager-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-computeoptimizer-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-accessanalyzer-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-schemas-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-imagebuilder-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-elasticinference-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-iotsecuretunneling-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-appconfig-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-wafv2-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-connectparticipant-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-migrationhubconfig-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-dataexchange-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-sesv2-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-marketplacecatalog-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-ssooidc-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-sso-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-savingsplans-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-codestarnotifications-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-workmailmessageflow-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-qldbsession-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-qldb-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-forecastquery-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-forecast-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-lakeformation-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-eventbridge-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-ec2instanceconnect-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-applicationinsights-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-servicequotas-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-personalizeevents-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-personalize-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-personalizeruntime-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-ioteventsdata-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-iotevents-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-iotthingsgraph-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-groundstation-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-mediapackagevod-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-managedblockchain-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-textract-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-worklink-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-backup-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-docdb-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-apigatewayv2-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-apigatewaymanagementapi-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-kafka-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-appmesh-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-licensemanager-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-securityhub-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-fsx-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-mediaconnect-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-kinesisanalyticsv2-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-comprehendmedical-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-globalaccelerator-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-transfer-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-datasync-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-robomaker-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-amplify-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-quicksight-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-rdsdata-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-route53resolver-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-ram-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-s3control-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-pinpointsmsvoice-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-pinpointemail-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-chime-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-signer-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-dlm-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-macie-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-eks-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-mediatailor-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-neptune-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-pi-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-iot1clickprojects-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-iot1clickdevices-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-iotanalytics-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-acmpca-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-secretsmanager-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-fms-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-connect-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-transcribe-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-autoscalingplans-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-workmail-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-servicediscovery-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-cloud9-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-serverlessapplicationrepository-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-alexaforbusiness-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-resourcegroups-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-comprehend-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-translate-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-sagemaker-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-iotjobsdataplane-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-sagemakerruntime-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-kinesisvideo-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-appsync-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-guardduty-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-mq-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-mediaconvert-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-mediastore-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-mediastoredata-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-medialive-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-mediapackage-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-costexplorer-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-pricing-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-mobile-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-cloudhsmv2-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-glue-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-migrationhub-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-dax-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-greengrass-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-athena-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-marketplaceentitlement-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-codestar-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-lexmodelbuilding-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-resourcegroupstaggingapi-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-pinpoint-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-xray-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-opsworkscm-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-support-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-simpledb-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-servicecatalog-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-servermigration-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-swf-libraries-1.11.22.jar;%APP_HOME%\lib\aws-java-sdk-simpleworkflow-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-storagegateway-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-route53-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-glacier-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-cloudwatchmetrics-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-dynamodb-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-s3-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-importexport-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-sts-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-sns-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-sqs-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-rds-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-redshift-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-elasticbeanstalk-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-iam-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-datapipeline-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-elasticloadbalancing-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-elasticloadbalancingv2-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-emr-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-elasticache-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-elastictranscoder-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-ec2-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-budgets-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-cloudtrail-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-cloudwatch-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-logs-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-events-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-cognitoidentity-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-cognitosync-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-directconnect-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-cloudformation-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-cloudfront-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-clouddirectory-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-kinesis-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-opsworks-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-ses-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-autoscaling-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-cloudsearch-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-codedeploy-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-codepipeline-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-kms-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-config-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-lambda-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-ecs-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-ecr-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-cloudhsm-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-ssm-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-workspaces-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-machinelearning-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-directory-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-efs-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-codecommit-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-devicefarm-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-elasticsearch-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-waf-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-marketplacecommerceanalytics-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-inspector-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-iot-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-api-gateway-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-acm-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-gamelift-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-dms-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-marketplacemeteringservice-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-cognitoidp-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-discovery-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-applicationautoscaling-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-snowball-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-rekognition-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-polly-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-lightsail-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-stepfunctions-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-health-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-costandusagereport-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-codebuild-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-appstream-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-shield-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-batch-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-lex-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-mechanicalturkrequester-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-organizations-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-workdocs-1.11.723.jar;%APP_HOME%\lib\aws-java-sdk-core-1.11.723.jar;%APP_HOME%\lib\kork-stackdriver-7.26.0-SNAPSHOT.jar;%APP_HOME%\lib\spectator-web-spring-0.75.0.jar;%APP_HOME%\lib\artifactory-java-client-api-2.8.1.jar;%APP_HOME%\lib\artifactory-java-client-httpClient-2.8.1.jar;%APP_HOME%\lib\spring-boot-actuator-2.2.7.RELEASE.jar;%APP_HOME%\lib\jackson-datatype-jsr310-2.10.4.jar;%APP_HOME%\lib\jackson-datatype-jdk8-2.10.4.jar;%APP_HOME%\lib\jackson-module-parameter-names-2.10.4.jar;%APP_HOME%\lib\jmespath-java-1.11.723.jar;%APP_HOME%\lib\spring-cloud-config-client-2.1.3.RELEASE.jar;%APP_HOME%\lib\jackson-databind-2.10.4.jar;%APP_HOME%\lib\jackson-annotations-2.10.4.jar;%APP_HOME%\lib\jackson-dataformat-yaml-2.10.2.jar;%APP_HOME%\lib\google-auth-library-oauth2-http-0.18.0.jar;%APP_HOME%\lib\google-api-services-cloudbuild-v1-rev836-1.25.0.jar;%APP_HOME%\lib\google-api-services-storage-v1-rev141-1.25.0.jar;%APP_HOME%\lib\google-api-services-monitoring-v3-rev477-1.25.0.jar;%APP_HOME%\lib\google-api-client-1.28.0.jar;%APP_HOME%\lib\google-http-client-jackson2-1.32.1.jar;%APP_HOME%\lib\jackson-dataformat-cbor-2.10.2.jar;%APP_HOME%\lib\jackson-core-2.10.4.jar;%APP_HOME%\lib\retrofit1-okhttp3-client-1.1.0.jar;%APP_HOME%\lib\converter-simplexml-1.9.0.jar;%APP_HOME%\lib\retrofit-1.9.0.jar;%APP_HOME%\lib\okhttp-apache-2.7.0.jar;%APP_HOME%\lib\okhttp-urlconnection-2.7.0.jar;%APP_HOME%\lib\okhttp-2.7.0.jar;%APP_HOME%\lib\okhttp-sse-3.14.2.jar;%APP_HOME%\lib\spring-boot-starter-security-2.2.7.RELEASE.jar;%APP_HOME%\lib\spring-security-config-5.2.4.RELEASE.jar;%APP_HOME%\lib\spring-security-web-5.2.4.RELEASE.jar;%APP_HOME%\lib\spring-security-core-5.2.4.RELEASE.jar;%APP_HOME%\lib\kork-telemetry-7.26.0-SNAPSHOT.jar;%APP_HOME%\lib\rxjava-1.3.8.jar;%APP_HOME%\lib\resilience4j-spring-boot2-1.0.0.jar;%APP_HOME%\lib\resilience4j-spring-boot-common-1.0.0.jar;%APP_HOME%\lib\resilience4j-spring-1.0.0.jar;%APP_HOME%\lib\resilience4j-framework-common-1.0.0.jar;%APP_HOME%\lib\resilience4j-retry-1.0.0.jar;%APP_HOME%\lib\reactor-core-3.3.5.RELEASE.jar;%APP_HOME%\lib\netflix-infix-0.3.0.jar;%APP_HOME%\lib\consul-api-1.4.1.jar;%APP_HOME%\lib\gson-2.8.6.jar;%APP_HOME%\lib\groovy-test-junit5-2.5.11.jar;%APP_HOME%\lib\junit-jupiter-engine-5.6.0.jar;%APP_HOME%\lib\junit-jupiter-api-5.6.0.jar;%APP_HOME%\lib\junit-platform-launcher-1.6.0.jar;%APP_HOME%\lib\junit-platform-engine-1.6.0.jar;%APP_HOME%\lib\junit-platform-commons-1.6.0.jar;%APP_HOME%\lib\groovy-test-2.5.11.jar;%APP_HOME%\lib\junit-4.12.jar;%APP_HOME%\lib\micrometer-core-1.3.8.jar;%APP_HOME%\lib\netty-codec-http-4.1.49.Final.jar;%APP_HOME%\lib\netty-handler-4.1.49.Final.jar;%APP_HOME%\lib\netty-codec-4.1.49.Final.jar;%APP_HOME%\lib\netty-transport-4.1.49.Final.jar;%APP_HOME%\lib\netty-buffer-4.1.49.Final.jar;%APP_HOME%\lib\netty-resolver-4.1.49.Final.jar;%APP_HOME%\lib\netty-common-4.1.49.Final.jar;%APP_HOME%\lib\reactive-streams-1.0.3.jar;%APP_HOME%\lib\spring-boot-starter-validation-2.2.7.RELEASE.jar;%APP_HOME%\lib\spring-boot-starter-aop-2.2.7.RELEASE.jar;%APP_HOME%\lib\spring-boot-starter-2.2.7.RELEASE.jar;%APP_HOME%\lib\spring-boot-starter-logging-2.2.7.RELEASE.jar;%APP_HOME%\lib\log4j-to-slf4j-2.12.1.jar;%APP_HOME%\lib\log4j-api-2.12.1.jar;%APP_HOME%\lib\spring-boot-autoconfigure-2.2.7.RELEASE.jar;%APP_HOME%\lib\spring-boot-2.2.7.RELEASE.jar;%APP_HOME%\lib\spring-webmvc-5.2.6.RELEASE.jar;%APP_HOME%\lib\spring-context-5.2.6.RELEASE.jar;%APP_HOME%\lib\spring-aop-5.2.6.RELEASE.jar;%APP_HOME%\lib\spring-web-5.2.6.RELEASE.jar;%APP_HOME%\lib\spring-beans-5.2.6.RELEASE.jar;%APP_HOME%\lib\spring-expression-5.2.6.RELEASE.jar;%APP_HOME%\lib\spring-core-5.2.6.RELEASE.jar;%APP_HOME%\lib\spring-jcl-5.2.6.RELEASE.jar;%APP_HOME%\lib\spring-cloud-context-2.1.2.RELEASE.jar;%APP_HOME%\lib\spring-cloud-commons-2.1.2.RELEASE.jar;%APP_HOME%\lib\spring-security-crypto-5.2.4.RELEASE.jar;%APP_HOME%\lib\spring-boot-configuration-metadata-2.2.7.RELEASE.jar;%APP_HOME%\lib\spring-boot-starter-tomcat-2.2.7.RELEASE.jar;%APP_HOME%\lib\antlr-runtime-3.4.jar;%APP_HOME%\lib\stringtemplate-3.2.1.jar;%APP_HOME%\lib\antlr-2.7.7.jar;%APP_HOME%\lib\logback-classic-1.2.3.jar;%APP_HOME%\lib\logback-core-1.2.3.jar;%APP_HOME%\lib\hibernate-validator-6.0.19.Final.jar;%APP_HOME%\lib\classmate-1.5.1.jar;%APP_HOME%\lib\guava-2.8.2.jar;%APP_HOME%\lib\caffeine-2.8.2.jar;%APP_HOME%\lib\okhttp-3.14.8.jar;%APP_HOME%\lib\jersey-apache-client4-1.19.1.jar;%APP_HOME%\lib\google-oauth-client-1.28.0.jar;%APP_HOME%\lib\google-http-client-apache-2.0.0.jar;%APP_HOME%\lib\google-http-client-1.32.1.jar;%APP_HOME%\lib\org.eclipse.jgit.http.apache-5.1.3.201810200350-r.jar;%APP_HOME%\lib\httpclient-4.5.12.jar;%APP_HOME%\lib\commons-codec-1.13.jar;%APP_HOME%\lib\jakarta.xml.bind-api-2.3.3.jar;%APP_HOME%\lib\jakarta.activation-api-1.2.2.jar;%APP_HOME%\lib\jakarta.annotation-api-1.3.5.jar;%APP_HOME%\lib\jakarta.validation-api-2.0.2.jar;%APP_HOME%\lib\javax.activation-api-1.2.0.jar;%APP_HOME%\lib\validation-api-2.0.1.Final.jar;%APP_HOME%\lib\joda-time-2.10.6.jar;%APP_HOME%\lib\jinjava-2.2.3.jar;%APP_HOME%\lib\dyno-core-1.7.2.jar;%APP_HOME%\lib\commons-lang3-3.9.jar;%APP_HOME%\lib\jedis-3.1.0.jar;%APP_HOME%\lib\commons-pool2-2.7.0.jar;%APP_HOME%\lib\httpcore-4.4.13.jar;%APP_HOME%\lib\tomcat-embed-websocket-9.0.34.jar;%APP_HOME%\lib\tomcat-embed-core-9.0.34.jar;%APP_HOME%\lib\tomcat-annotations-api-9.0.34.jar;%APP_HOME%\lib\tomcat-embed-el-9.0.34.jar;%APP_HOME%\lib\aspectjrt-1.9.5.jar;%APP_HOME%\lib\aspectjweaver-1.9.5.jar;%APP_HOME%\lib\groovy-ant-2.5.11.jar;%APP_HOME%\lib\groovy-cli-commons-2.5.11.jar;%APP_HOME%\lib\groovy-groovysh-2.5.11.jar;%APP_HOME%\lib\groovy-console-2.5.11.jar;%APP_HOME%\lib\groovy-groovydoc-2.5.11.jar;%APP_HOME%\lib\groovy-docgenerator-2.5.11.jar;%APP_HOME%\lib\groovy-cli-picocli-2.5.11.jar;%APP_HOME%\lib\groovy-datetime-2.5.11.jar;%APP_HOME%\lib\groovy-jmx-2.5.11.jar;%APP_HOME%\lib\groovy-json-2.5.11.jar;%APP_HOME%\lib\groovy-jsr223-2.5.11.jar;%APP_HOME%\lib\groovy-macro-2.5.11.jar;%APP_HOME%\lib\groovy-nio-2.5.11.jar;%APP_HOME%\lib\groovy-servlet-2.5.11.jar;%APP_HOME%\lib\groovy-sql-2.5.11.jar;%APP_HOME%\lib\groovy-swing-2.5.11.jar;%APP_HOME%\lib\groovy-templates-2.5.11.jar;%APP_HOME%\lib\groovy-testng-2.5.11.jar;%APP_HOME%\lib\groovy-xml-2.5.11.jar;%APP_HOME%\lib\groovy-2.5.11.jar;%APP_HOME%\lib\hamcrest-core-2.1.jar;%APP_HOME%\lib\hamcrest-2.1.jar;%APP_HOME%\lib\jboss-logging-3.4.1.Final.jar;%APP_HOME%\lib\lombok-1.18.12.jar;%APP_HOME%\lib\jcl-over-slf4j-1.7.30.jar;%APP_HOME%\lib\jul-to-slf4j-1.7.30.jar;%APP_HOME%\lib\log4j-over-slf4j-1.7.30.jar;%APP_HOME%\lib\spectator-ext-gc-0.75.0.jar;%APP_HOME%\lib\spectator-ext-jvm-0.75.0.jar;%APP_HOME%\lib\spectator-api-0.75.0.jar;%APP_HOME%\lib\servo-core-0.12.21.jar;%APP_HOME%\lib\resilience4j-consumer-1.0.0.jar;%APP_HOME%\lib\resilience4j-circuitbreaker-1.0.0.jar;%APP_HOME%\lib\resilience4j-ratelimiter-1.0.0.jar;%APP_HOME%\lib\resilience4j-bulkhead-1.0.0.jar;%APP_HOME%\lib\resilience4j-core-1.0.0.jar;%APP_HOME%\lib\resilience4j-annotations-1.0.0.jar;%APP_HOME%\lib\org.eclipse.jgit-5.1.3.201810200350-r.jar;%APP_HOME%\lib\resilience4j-micrometer-1.0.0.jar;%APP_HOME%\lib\resilience4j-circularbuffer-1.0.0.jar;%APP_HOME%\lib\slf4j-api-1.7.30.jar;%APP_HOME%\lib\snakeyaml-1.25.jar;%APP_HOME%\lib\spring-security-rsa-1.0.7.RELEASE.jar;%APP_HOME%\lib\jersey-client-1.19.1.jar;%APP_HOME%\lib\jersey-core-1.19.1.jar;%APP_HOME%\lib\xstream-1.4.11.1.jar;%APP_HOME%\lib\jsch-0.1.54.jar;%APP_HOME%\lib\aws-java-sdk-models-1.11.723.jar;%APP_HOME%\lib\kork-annotations-7.26.0-SNAPSHOT.jar;%APP_HOME%\lib\kork-exceptions-7.26.0-SNAPSHOT.jar;%APP_HOME%\lib\guice-4.1.0.jar;%APP_HOME%\lib\opencensus-contrib-http-util-0.24.0.jar;%APP_HOME%\lib\guava-29.0-jre.jar;%APP_HOME%\lib\jsr305-3.0.2.jar;%APP_HOME%\lib\commons-io-2.6.jar;%APP_HOME%\lib\commons-configuration-1.8.jar;%APP_HOME%\lib\bcpkix-jdk15on-1.61.jar;%APP_HOME%\lib\bcprov-jdk15on-1.61.jar;%APP_HOME%\lib\woodstox-core-6.0.3.jar;%APP_HOME%\lib\stax2-api-4.2.jar;%APP_HOME%\lib\jettison-1.3.7.jar;%APP_HOME%\lib\jsr311-api-1.1.1.jar;%APP_HOME%\lib\compactmap-1.2.1.jar;%APP_HOME%\lib\auto-value-annotations-1.6.6.jar;%APP_HOME%\lib\google-auth-library-credentials-0.18.0.jar;%APP_HOME%\lib\okio-1.17.2.jar;%APP_HOME%\lib\simple-xml-2.7.1.jar;%APP_HOME%\lib\vavr-0.10.0.jar;%APP_HOME%\lib\javax.inject-1.jar;%APP_HOME%\lib\commons-lang-2.6.jar;%APP_HOME%\lib\android-json-0.0.20131108.vaadin1.jar;%APP_HOME%\lib\HdrHistogram-2.1.11.jar;%APP_HOME%\lib\LatencyUtils-2.0.3.jar;%APP_HOME%\lib\stax-1.2.0.jar;%APP_HOME%\lib\stax-api-1.0.1.jar;%APP_HOME%\lib\commons-math-2.2.jar;%APP_HOME%\lib\xmlpull-1.1.3.1.jar;%APP_HOME%\lib\xpp3_min-1.1.4c.jar;%APP_HOME%\lib\aopalliance-1.0.jar;%APP_HOME%\lib\dexx-collections-0.2.jar;%APP_HOME%\lib\j2objc-annotations-1.3.jar;%APP_HOME%\lib\opencensus-api-0.24.0.jar;%APP_HOME%\lib\ion-java-1.0.2.jar;%APP_HOME%\lib\xpp3-1.1.3.3.jar;%APP_HOME%\lib\vavr-match-0.10.0.jar;%APP_HOME%\lib\javassist-3.19.0-GA.jar;%APP_HOME%\lib\jsoup-1.8.1.jar;%APP_HOME%\lib\annotations-3.0.0.jar;%APP_HOME%\lib\commons-logging-1.1.1.jar;%APP_HOME%\lib\config-1.3.3.jar;%APP_HOME%\lib\json-simple-1.1.jar;%APP_HOME%\lib\asm-5.0.4.jar;%APP_HOME%\lib\checker-qual-3.3.0.jar;%APP_HOME%\lib\error_prone_annotations-2.3.4.jar;%APP_HOME%\lib\ant-junit-1.9.13.jar;%APP_HOME%\lib\ant-1.9.13.jar;%APP_HOME%\lib\ant-launcher-1.9.13.jar;%APP_HOME%\lib\ant-antlr-1.9.13.jar;%APP_HOME%\lib\commons-cli-1.4.jar;%APP_HOME%\lib\picocli-4.0.1.jar;%APP_HOME%\lib\qdox-1.12.1.jar;%APP_HOME%\lib\jline-2.14.6.jar;%APP_HOME%\lib\testng-6.13.1.jar;%APP_HOME%\lib\commons-jxpath-1.3.jar;%APP_HOME%\lib\servlet-api-2.5.jar;%APP_HOME%\lib\grpc-context-1.22.1.jar;%APP_HOME%\lib\jzlib-1.1.1.jar;%APP_HOME%\lib\JavaEWAH-1.1.6.jar;%APP_HOME%\lib\failureaccess-1.0.1.jar;%APP_HOME%\lib\listenablefuture-9999.0-empty-to-avoid-conflict-with-guava.jar;%APP_HOME%\lib\apiguardian-api-1.1.0.jar;%APP_HOME%\lib\jcommander-1.72.jar;%APP_HOME%\lib\opentest4j-1.2.0.jar

@rem Execute igor
"%JAVA_EXE%" %DEFAULT_JVM_OPTS% %JAVA_OPTS% %IGOR_OPTS%  -classpath "%CLASSPATH%" com.netflix.spinnaker.igor.Main %CMD_LINE_ARGS%

:end
@rem End local scope for the variables with windows NT shell
if "%ERRORLEVEL%"=="0" goto mainEnd

:fail
rem Set variable IGOR_EXIT_CONSOLE if you need the _script_ return code instead of
rem the _cmd.exe /c_ return code!
if  not "" == "%IGOR_EXIT_CONSOLE%" exit 1
exit /b 1

:mainEnd
if "%OS%"=="Windows_NT" endlocal

:omega