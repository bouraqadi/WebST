Class {
	#name : 'WsOuterCompositeForInitTest',
	#superclass : 'WsBasicComponentForInitTest',
	#traits : 'WsTConcreteComponent',
	#classTraits : 'WsTConcreteComponent classTrait',
	#instVars : [
		'middleComposite'
	],
	#category : 'WebST-Tests-Initialization',
	#package : 'WebST-Tests',
	#tag : 'Initialization'
}

{ #category : 'accessing' }
WsOuterCompositeForInitTest class >> viewClass [
	<pharoJsSkip>
	^WsLevel3InitTestView 
]

{ #category : 'initialization' }
WsOuterCompositeForInitTest >> beReady [ 
	super beReady.
	middleComposite := self viewFirstComponent: WsMiddleCompositeForInitTest 
]

{ #category : 'accessing' }
WsOuterCompositeForInitTest >> middleComposite [
	^middleComposite 
]
