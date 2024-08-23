Class {
	#name : 'WsCompositeComponentInitSubView',
	#superclass : 'WsComponent',
	#traits : 'WsTConcreteComponent',
	#classTraits : 'WsTConcreteComponent classTrait',
	#category : 'WebST-Examples-ViewCustomization',
	#package : 'WebST-Examples',
	#tag : 'ViewCustomization'
}

{ #category : 'accessing' }
WsCompositeComponentInitSubView class >> viewClass [

	<pharoJsSkip>
	^ WsCompositeInitSubView 
]
