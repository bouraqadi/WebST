Class {
	#name : 'WsViewCustomizingApp',
	#superclass : 'PjWebApplication',
	#traits : 'WsTViewBasedApp',
	#classTraits : 'WsTViewBasedApp classTrait',
	#category : 'WebST-Examples-ViewCustomization',
	#package : 'WebST-Examples',
	#tag : 'ViewCustomization'
}

{ #category : 'rendering' }
WsViewCustomizingApp class >> beforeRendering: rootView [
	<pharoJsSkip>
	rootView textContent: self viewTextContent
	
]

{ #category : 'accessing' }
WsViewCustomizingApp class >> viewClass [

	<pharoJsSkip>
	^WsInitializableView 
]

{ #category : 'rendering' }
WsViewCustomizingApp class >> viewTextContent [
	<pharoJsSkip>
	^'This is a static page based on a view customized upon html export'
]
