Class {
	#name : 'WsLevel2InitTestComponent',
	#superclass : 'WsInitTestComponent',
	#traits : 'WsTConcreteComponent',
	#classTraits : 'WsTConcreteComponent classTrait',
	#instVars : [
		'level1Subcomponent'
	],
	#category : 'WebST-Tests-Initialization',
	#package : 'WebST-Tests',
	#tag : 'Initialization'
}

{ #category : 'accessing' }
WsLevel2InitTestComponent class >> viewClass [
	<pharoJsSkip>
	^WsLevel2InitTestView 
]

{ #category : 'accessing' }
WsLevel2InitTestComponent >> level1Subcomponent [
	^level1Subcomponent 
]

{ #category : 'initialization' }
WsLevel2InitTestComponent >> postConnectInitialize [

	super postConnectInitialize.
	level1Subcomponent := self viewFirstComponent: WsInitTestComponent 
]
