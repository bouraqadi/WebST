Class {
	#name : 'WsLeafComponentReferencedByView',
	#superclass : 'WsComponent',
	#traits : 'WsTConcreteComponent',
	#classTraits : 'WsTConcreteComponent classTrait',
	#category : 'WebST-Examples-CompositeComponents',
	#package : 'WebST-Examples',
	#tag : 'CompositeComponents'
}

{ #category : 'class initialization' }
WsLeafComponentReferencedByView class >> tagName [

	^'ws-leaf-component-referenced-by-view'
]

{ #category : 'accessing' }
WsLeafComponentReferencedByView class >> viewClass [

	<pharoJsSkip>
	^WsViewForLeafComponentReferencedByView
]
