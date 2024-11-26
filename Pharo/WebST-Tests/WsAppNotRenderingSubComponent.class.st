Class {
	#name : 'WsAppNotRenderingSubComponent',
	#superclass : 'PjWebApplication',
	#traits : 'WsTViewBasedApp',
	#classTraits : 'WsTViewBasedApp classTrait',
	#category : 'WebST-Tests-Views',
	#package : 'WebST-Tests',
	#tag : 'Views'
}

{ #category : 'accessing' }
WsAppNotRenderingSubComponent class >> viewClass [

	<pharoJsSkip>
	^WsViewNotRenderingSubComponent 
]
