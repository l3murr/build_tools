FROM amazon/dynamodb-local:2.6.1
ENTRYPOINT ["java"]
CMD ["-jar", "/home/dynamodblocal/DynamoDBLocal.jar", "-sharedDb"]
