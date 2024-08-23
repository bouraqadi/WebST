Class {
	#name : 'WsViewCustomizingComponent',
	#superclass : 'WsComponent',
	#traits : 'WsTConcreteComponent',
	#classTraits : 'WsTConcreteComponent classTrait',
	#category : 'WebST-Examples-ViewCustomization',
	#package : 'WebST-Examples',
	#tag : 'ViewCustomization'
}

{ #category : 'rendering' }
WsViewCustomizingComponent class >> beforeRendering: rootView [
	<pharoJsSkip>
	rootView textContent: self viewTextContent 
]

{ #category : 'accessing' }
WsViewCustomizingComponent class >> viewClass [

	<pharoJsSkip>
	^WsInitializableView 
]

{ #category : 'rendering' }
WsViewCustomizingComponent class >> viewTextContent [
	<pharoJsSkip>
	^'Just for Html generation for ', self name
]
