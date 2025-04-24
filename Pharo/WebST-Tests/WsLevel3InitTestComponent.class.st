Class {
	#name : 'WsLevel3InitTestComponent',
	#superclass : 'WsInitTestComponent',
	#traits : 'WsTConcreteComponent',
	#classTraits : 'WsTConcreteComponent classTrait',
	#instVars : [
		'level2Subcomponent'
	],
	#category : 'WebST-Tests-Initialization',
	#package : 'WebST-Tests',
	#tag : 'Initialization'
}

{ #category : 'accessing' }
WsLevel3InitTestComponent class >> viewClass [
	<pharoJsSkip>
	^WsLevel3InitTestView 
]

{ #category : 'accessing' }
WsLevel3InitTestComponent >> level1SubSubcomponent [
	^self level2Subcomponent level1Subcomponent 
]

{ #category : 'accessing' }
WsLevel3InitTestComponent >> level2Subcomponent [
	^level2Subcomponent 
]

{ #category : 'initialization' }
WsLevel3InitTestComponent >> preConnectInitialize [ 
	super preConnectInitialize.
	level2Subcomponent := self viewFirstComponent: WsLevel2InitTestComponent 
]

{ #category : 'accessing' }
WsLevel3InitTestComponent >> withSubcmponentsInInitializationOrder [
	^{
	self level1SubSubcomponent.
	self level2Subcomponent.
	self}
]
