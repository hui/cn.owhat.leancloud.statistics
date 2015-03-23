/********* CDVstatistics.m Cordova Plugin Implementation *******/

#import <Cordova/CDV.h>
#import <AVOSCloud/AVOSCloud.h>

@interface CDVstatistics : CDVPlugin {
  // Member variables go here.
}

- (void)beginLogPageView:(CDVInvokedUrlCommand*)command;
- (void)endLogPageView:(CDVInvokedUrlCommand*)command;
- (void)event:(CDVInvokedUrlCommand*)command;

@end

@implementation CDVstatistics

- (void)beginLogPageView:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    NSString* name = [command.arguments objectAtIndex:0];

    [AVAnalytics beginLogPageView: name];

    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"done"];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)endLogPageView:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    NSString* name = [command.arguments objectAtIndex:0];

    [AVAnalytics endLogPageView: name];

    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"done"];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)event:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    NSString* name = [command.arguments objectAtIndex:0];
    NSString* label = [command.arguments objectAtIndex:1];

    [AVAnalytics event:[NSString stringWithFormat:name] label:label];

    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"done"];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end
