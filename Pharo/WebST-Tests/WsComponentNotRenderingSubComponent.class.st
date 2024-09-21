Class {
	#name : 'WsComponentNotRenderingSubComponent',
	#superclass : 'WsComponent',
	#category : 'WebST-Tests-Views',
	#package : 'WebST-Tests',
	#tag : 'Views'
}

{ #category : 'accessing' }
WsComponentNotRenderingSubComponent class >> viewClass [

	<pharoJsSkip>
	^ WsViewNotRenderingSubComponent
]
