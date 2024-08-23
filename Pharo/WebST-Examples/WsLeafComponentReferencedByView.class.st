Class {
	#name : 'WsLeafComponentReferencedByView',
	#superclass : 'WsComponent',
	#traits : 'WsTConcreteComponent',
	#classTraits : 'WsTConcreteComponent classTrait',
	#category : 'WebST-Examples-CompositeComponents',
	#package : 'WebST-Examples',
	#tag : 'CompositeComponents'
}

{ #category : 'accessing' }
WsLeafComponentReferencedByView class >> viewClass [

	<pharoJsSkip>
	^WsViewForLeafComponentReferencedByView
]
