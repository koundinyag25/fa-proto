/**
 * @fileoverview gRPC-Web generated client stub for usermanagement
 * @enhanceable
 * @public
 */

// Code generated by protoc-gen-grpc-web. DO NOT EDIT.
// versions:
// 	protoc-gen-grpc-web v1.5.0
// 	protoc              v5.27.3
// source: protos/user-management/user-management.proto


/* eslint-disable */
// @ts-nocheck



const grpc = {};
grpc.web = require('grpc-web');

const proto = {};
proto.usermanagement = require('./user-management_pb.js');

/**
 * @param {string} hostname
 * @param {?Object} credentials
 * @param {?grpc.web.ClientOptions} options
 * @constructor
 * @struct
 * @final
 */
proto.usermanagement.UserManagementServiceClient =
    function(hostname, credentials, options) {
  if (!options) options = {};
  options.format = 'text';

  /**
   * @private @const {!grpc.web.GrpcWebClientBase} The client
   */
  this.client_ = new grpc.web.GrpcWebClientBase(options);

  /**
   * @private @const {string} The hostname
   */
  this.hostname_ = hostname.replace(/\/+$/, '');

};


/**
 * @param {string} hostname
 * @param {?Object} credentials
 * @param {?grpc.web.ClientOptions} options
 * @constructor
 * @struct
 * @final
 */
proto.usermanagement.UserManagementServicePromiseClient =
    function(hostname, credentials, options) {
  if (!options) options = {};
  options.format = 'text';

  /**
   * @private @const {!grpc.web.GrpcWebClientBase} The client
   */
  this.client_ = new grpc.web.GrpcWebClientBase(options);

  /**
   * @private @const {string} The hostname
   */
  this.hostname_ = hostname.replace(/\/+$/, '');

};


/**
 * @const
 * @type {!grpc.web.MethodDescriptor<
 *   !proto.usermanagement.CreateUserRequest,
 *   !proto.usermanagement.CreateUserResponse>}
 */
const methodDescriptor_UserManagementService_CreateUser = new grpc.web.MethodDescriptor(
  '/usermanagement.UserManagementService/CreateUser',
  grpc.web.MethodType.UNARY,
  proto.usermanagement.CreateUserRequest,
  proto.usermanagement.CreateUserResponse,
  /**
   * @param {!proto.usermanagement.CreateUserRequest} request
   * @return {!Uint8Array}
   */
  function(request) {
    return request.serializeBinary();
  },
  proto.usermanagement.CreateUserResponse.deserializeBinary
);


/**
 * @param {!proto.usermanagement.CreateUserRequest} request The
 *     request proto
 * @param {?Object<string, string>} metadata User defined
 *     call metadata
 * @param {function(?grpc.web.RpcError, ?proto.usermanagement.CreateUserResponse)}
 *     callback The callback function(error, response)
 * @return {!grpc.web.ClientReadableStream<!proto.usermanagement.CreateUserResponse>|undefined}
 *     The XHR Node Readable Stream
 */
proto.usermanagement.UserManagementServiceClient.prototype.createUser =
    function(request, metadata, callback) {
  return this.client_.rpcCall(this.hostname_ +
      '/usermanagement.UserManagementService/CreateUser',
      request,
      metadata || {},
      methodDescriptor_UserManagementService_CreateUser,
      callback);
};


/**
 * @param {!proto.usermanagement.CreateUserRequest} request The
 *     request proto
 * @param {?Object<string, string>=} metadata User defined
 *     call metadata
 * @return {!Promise<!proto.usermanagement.CreateUserResponse>}
 *     Promise that resolves to the response
 */
proto.usermanagement.UserManagementServicePromiseClient.prototype.createUser =
    function(request, metadata) {
  return this.client_.unaryCall(this.hostname_ +
      '/usermanagement.UserManagementService/CreateUser',
      request,
      metadata || {},
      methodDescriptor_UserManagementService_CreateUser);
};


/**
 * @const
 * @type {!grpc.web.MethodDescriptor<
 *   !proto.usermanagement.GetUserRequest,
 *   !proto.usermanagement.GetUserResponse>}
 */
const methodDescriptor_UserManagementService_GetUser = new grpc.web.MethodDescriptor(
  '/usermanagement.UserManagementService/GetUser',
  grpc.web.MethodType.UNARY,
  proto.usermanagement.GetUserRequest,
  proto.usermanagement.GetUserResponse,
  /**
   * @param {!proto.usermanagement.GetUserRequest} request
   * @return {!Uint8Array}
   */
  function(request) {
    return request.serializeBinary();
  },
  proto.usermanagement.GetUserResponse.deserializeBinary
);


/**
 * @param {!proto.usermanagement.GetUserRequest} request The
 *     request proto
 * @param {?Object<string, string>} metadata User defined
 *     call metadata
 * @param {function(?grpc.web.RpcError, ?proto.usermanagement.GetUserResponse)}
 *     callback The callback function(error, response)
 * @return {!grpc.web.ClientReadableStream<!proto.usermanagement.GetUserResponse>|undefined}
 *     The XHR Node Readable Stream
 */
proto.usermanagement.UserManagementServiceClient.prototype.getUser =
    function(request, metadata, callback) {
  return this.client_.rpcCall(this.hostname_ +
      '/usermanagement.UserManagementService/GetUser',
      request,
      metadata || {},
      methodDescriptor_UserManagementService_GetUser,
      callback);
};


/**
 * @param {!proto.usermanagement.GetUserRequest} request The
 *     request proto
 * @param {?Object<string, string>=} metadata User defined
 *     call metadata
 * @return {!Promise<!proto.usermanagement.GetUserResponse>}
 *     Promise that resolves to the response
 */
proto.usermanagement.UserManagementServicePromiseClient.prototype.getUser =
    function(request, metadata) {
  return this.client_.unaryCall(this.hostname_ +
      '/usermanagement.UserManagementService/GetUser',
      request,
      metadata || {},
      methodDescriptor_UserManagementService_GetUser);
};


module.exports = proto.usermanagement;

