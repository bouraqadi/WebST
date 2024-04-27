Class {
	#name : #WsCompositeResource,
	#superclass : #WsResource,
	#traits : 'WsTCompositeElement',
	#classTraits : 'WsTCompositeElement classTrait',
	#category : #'WebSt-Base-Resources'
}

{ #category : #'instance creation' }
WsCompositeResource class >> withAll: allChildren [
	^self new
		addAll: allChildren;
		yourself
]

{ #category : #accessing }
WsCompositeResource >> addTo: aWsRenderer [

	aWsRenderer addAllResources:  self children 
]
