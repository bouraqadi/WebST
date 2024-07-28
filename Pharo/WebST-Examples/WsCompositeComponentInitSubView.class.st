Class {
	#name : 'WsCompositeComponentInitSubView',
	#superclass : 'WsComponent',
	#traits : 'WsTConcreteComponent',
	#classTraits : 'WsTConcreteComponent classTrait',
	#category : 'WebST-Examples-CompositeComponents',
	#package : 'WebST-Examples',
	#tag : 'CompositeComponents'
}

{ #category : 'class initialization' }
WsCompositeComponentInitSubView class >> tagName [

	^ 'ws-composite-init-sub-view'
]

{ #category : 'accessing' }
WsCompositeComponentInitSubView class >> viewClass [

	<pharoJsSkip>
	^ WsCompositeInitSubView 
]
