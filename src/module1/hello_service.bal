import ballerina/http;
import ballerina/log;

@http:ServiceConfig {
    basePath: "/"
}
service hello on new http:Listener(9090) {

    @http:ResourceConfig {
        path: "/"
    }
    resource function sayHello(http:Caller caller, http:Request req) {

        var result = caller->respond("Hello, World!");

        if (result is error) {
            log:printError("Error sending response", result);
        }
    }

    @http:ResourceConfig {
        path: "/bal"
    }
    resource function sayHelloBallerina(http:Caller caller, http:Request req) {

        var result = caller->respond("Hello, Ballerina!");

        if (result is error) {
            log:printError("Error sending response", result);
        }
    }
}
