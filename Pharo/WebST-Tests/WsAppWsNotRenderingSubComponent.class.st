Class {
	#name : 'WsAppWsNotRenderingSubComponent',
	#superclass : 'PjWebApplication',
	#traits : 'WsTViewBasedApp',
	#classTraits : 'WsTViewBasedApp classTrait',
	#category : 'WebST-Tests-Views',
	#package : 'WebST-Tests',
	#tag : 'Views'
}

{ #category : 'accessing' }
WsAppWsNotRenderingSubComponent class >> viewClass [

	<pharoJsSkip>
	^WsViewNotRenderingSubComponent 
]
