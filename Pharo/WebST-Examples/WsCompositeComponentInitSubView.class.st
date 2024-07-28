Class {
	#name : 'WsCompositeComponentInitSubView',
	#superclass : 'WsComponent',
	#traits : 'WsTConcreteComponent',
	#classTraits : 'WsTConcreteComponent classTrait',
	#category : 'WebST-Examples-ViewCustomization',
	#package : 'WebST-Examples',
	#tag : 'ViewCustomization'
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
