Class {
	#name : 'WsMiddleCompositeForInitTest',
	#superclass : 'WsBasicComponentForInitTest',
	#traits : 'WsTConcreteComponent',
	#classTraits : 'WsTConcreteComponent classTrait',
	#instVars : [
		'basicComponent'
	],
	#category : 'WebST-Tests-Initialization',
	#package : 'WebST-Tests',
	#tag : 'Initialization'
}

{ #category : 'accessing' }
WsMiddleCompositeForInitTest class >> viewClass [
	<pharoJsSkip>
	^WsLevel2InitTestView 
]

{ #category : 'accessing' }
WsMiddleCompositeForInitTest >> basicComponent [
	^basicComponent 
]

{ #category : 'initialization' }
WsMiddleCompositeForInitTest >> beReady [

	super beReady.
	basicComponent := self viewFirstComponent: WsBasicComponentForInitTest 
]
