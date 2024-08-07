// Code generated by protoc-gen-go-grpc. DO NOT EDIT.
// versions:
// - protoc-gen-go-grpc v1.5.1
// - protoc             v5.27.3
// source: protos/asset-management/asset-management.proto

package assetmanagement

import (
	context "context"
	grpc "google.golang.org/grpc"
	codes "google.golang.org/grpc/codes"
	status "google.golang.org/grpc/status"
)

// This is a compile-time assertion to ensure that this generated file
// is compatible with the grpc package it is being compiled against.
// Requires gRPC-Go v1.64.0 or later.
const _ = grpc.SupportPackageIsVersion9

const (
	UserManagementService_CreateAsset_FullMethodName = "/assetmanagement.UserManagementService/CreateAsset"
	UserManagementService_GetAsset_FullMethodName    = "/assetmanagement.UserManagementService/GetAsset"
)

// UserManagementServiceClient is the client API for UserManagementService service.
//
// For semantics around ctx use and closing/ending streaming RPCs, please refer to https://pkg.go.dev/google.golang.org/grpc/?tab=doc#ClientConn.NewStream.
type UserManagementServiceClient interface {
	CreateAsset(ctx context.Context, in *CreateAssetRequest, opts ...grpc.CallOption) (*CreateAssetResponse, error)
	GetAsset(ctx context.Context, in *GetAssetRequest, opts ...grpc.CallOption) (*GetAssetResponse, error)
}

type userManagementServiceClient struct {
	cc grpc.ClientConnInterface
}

func NewUserManagementServiceClient(cc grpc.ClientConnInterface) UserManagementServiceClient {
	return &userManagementServiceClient{cc}
}

func (c *userManagementServiceClient) CreateAsset(ctx context.Context, in *CreateAssetRequest, opts ...grpc.CallOption) (*CreateAssetResponse, error) {
	cOpts := append([]grpc.CallOption{grpc.StaticMethod()}, opts...)
	out := new(CreateAssetResponse)
	err := c.cc.Invoke(ctx, UserManagementService_CreateAsset_FullMethodName, in, out, cOpts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *userManagementServiceClient) GetAsset(ctx context.Context, in *GetAssetRequest, opts ...grpc.CallOption) (*GetAssetResponse, error) {
	cOpts := append([]grpc.CallOption{grpc.StaticMethod()}, opts...)
	out := new(GetAssetResponse)
	err := c.cc.Invoke(ctx, UserManagementService_GetAsset_FullMethodName, in, out, cOpts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

// UserManagementServiceServer is the server API for UserManagementService service.
// All implementations must embed UnimplementedUserManagementServiceServer
// for forward compatibility.
type UserManagementServiceServer interface {
	CreateAsset(context.Context, *CreateAssetRequest) (*CreateAssetResponse, error)
	GetAsset(context.Context, *GetAssetRequest) (*GetAssetResponse, error)
	mustEmbedUnimplementedUserManagementServiceServer()
}

// UnimplementedUserManagementServiceServer must be embedded to have
// forward compatible implementations.
//
// NOTE: this should be embedded by value instead of pointer to avoid a nil
// pointer dereference when methods are called.
type UnimplementedUserManagementServiceServer struct{}

func (UnimplementedUserManagementServiceServer) CreateAsset(context.Context, *CreateAssetRequest) (*CreateAssetResponse, error) {
	return nil, status.Errorf(codes.Unimplemented, "method CreateAsset not implemented")
}
func (UnimplementedUserManagementServiceServer) GetAsset(context.Context, *GetAssetRequest) (*GetAssetResponse, error) {
	return nil, status.Errorf(codes.Unimplemented, "method GetAsset not implemented")
}
func (UnimplementedUserManagementServiceServer) mustEmbedUnimplementedUserManagementServiceServer() {}
func (UnimplementedUserManagementServiceServer) testEmbeddedByValue()                               {}

// UnsafeUserManagementServiceServer may be embedded to opt out of forward compatibility for this service.
// Use of this interface is not recommended, as added methods to UserManagementServiceServer will
// result in compilation errors.
type UnsafeUserManagementServiceServer interface {
	mustEmbedUnimplementedUserManagementServiceServer()
}

func RegisterUserManagementServiceServer(s grpc.ServiceRegistrar, srv UserManagementServiceServer) {
	// If the following call pancis, it indicates UnimplementedUserManagementServiceServer was
	// embedded by pointer and is nil.  This will cause panics if an
	// unimplemented method is ever invoked, so we test this at initialization
	// time to prevent it from happening at runtime later due to I/O.
	if t, ok := srv.(interface{ testEmbeddedByValue() }); ok {
		t.testEmbeddedByValue()
	}
	s.RegisterService(&UserManagementService_ServiceDesc, srv)
}

func _UserManagementService_CreateAsset_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(CreateAssetRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(UserManagementServiceServer).CreateAsset(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: UserManagementService_CreateAsset_FullMethodName,
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(UserManagementServiceServer).CreateAsset(ctx, req.(*CreateAssetRequest))
	}
	return interceptor(ctx, in, info, handler)
}

func _UserManagementService_GetAsset_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(GetAssetRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(UserManagementServiceServer).GetAsset(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: UserManagementService_GetAsset_FullMethodName,
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(UserManagementServiceServer).GetAsset(ctx, req.(*GetAssetRequest))
	}
	return interceptor(ctx, in, info, handler)
}

// UserManagementService_ServiceDesc is the grpc.ServiceDesc for UserManagementService service.
// It's only intended for direct use with grpc.RegisterService,
// and not to be introspected or modified (even as a copy)
var UserManagementService_ServiceDesc = grpc.ServiceDesc{
	ServiceName: "assetmanagement.UserManagementService",
	HandlerType: (*UserManagementServiceServer)(nil),
	Methods: []grpc.MethodDesc{
		{
			MethodName: "CreateAsset",
			Handler:    _UserManagementService_CreateAsset_Handler,
		},
		{
			MethodName: "GetAsset",
			Handler:    _UserManagementService_GetAsset_Handler,
		},
	},
	Streams:  []grpc.StreamDesc{},
	Metadata: "protos/asset-management/asset-management.proto",
}
