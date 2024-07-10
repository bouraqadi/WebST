Class {
	#name : #WsBootstrap5Icons1View,
	#superclass : #WsView,
	#traits : 'WsTBootstrap5View + WsTBootstrapIcons1View',
	#classTraits : 'WsTBootstrap5View classTrait + WsTBootstrapIcons1View classTrait',
	#category : #'WebST-Library-Bootstrap'
}

{ #category : #accessing }
WsBootstrap5Icons1View >> resources [

	^ self bootstrap5Resources, self bootstrapIcons1Resources 
]
