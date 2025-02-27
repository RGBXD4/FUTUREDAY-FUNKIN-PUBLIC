#if windows
package dxgi;

import cpp.Star;
import com.GUID;
import dxgi.interfaces.DxgiFactory;
import dxgi.interfaces.DxgiFactory.NativeIDXGIFactory;
import dxgi.constants.DxgiError;

using cpp.Native;

@:include('dxgi.h')
class Dxgi
{
	/**
	 * Creates a DXGI 1.0 factory that you can use to generate other DXGI objects.
	 * @param _factory Address of a pointer to an IDXGIFactory object.
	 * @return DXGIFactory
	 */
	static public function createFactory(_factory:DxgiFactory):DxgiError
	{
		return NativeDXGI.createFactory(NativeIDXGIFactory.uuid(), cast _factory.ptr.addressOf());
	}

	/**
	 * Creates a DXGI 1.1 factory that you can use to generate other DXGI objects.
	 * @param _factory Address of a pointer to an IDXGIFactory1 object.
	 * @return DXGIFactory1
	 */
	static public function createFactory1(_factory:DxgiFactory1):DxgiError
	{
		return NativeDXGI.createFactory1(DxgiFactory1.uuid, cast _factory.ptr.addressOf());
	}
}

@:keep
@:unreflective
@:structAccess
@:include('dxgi.h')
extern class NativeDXGI
{
	@:native('CreateDXGIFactory')
	static function createFactory(_guid:GUID, _ptr:Star<Star<cpp.Void>>):Int;

	@:native('CreateDXGIFactory1')
	static function createFactory1(_guid:GUID, _ptr:Star<Star<cpp.Void>>):Int;
}
#end
