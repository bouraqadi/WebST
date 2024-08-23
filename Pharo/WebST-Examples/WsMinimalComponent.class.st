Class {
	#name : 'WsMinimalComponent',
	#superclass : 'WsComponent',
	#traits : 'WsTConcreteComponent',
	#classTraits : 'WsTConcreteComponent classTrait',
	#category : 'WebST-Examples-Misc',
	#package : 'WebST-Examples',
	#tag : 'Misc'
}

{ #category : 'accessing' }
WsMinimalComponent class >> viewClass [

	<pharoJsSkip>
	^ WsMinimalView
]
