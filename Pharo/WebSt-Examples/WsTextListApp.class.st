Class {
	#name : #WsTextListApp,
	#superclass : #PjWebApplication,
	#traits : 'WsTComponentApp',
	#classTraits : 'WsTComponentApp classTrait',
	#category : #'WebSt-Examples-List'
}

{ #category : #rendering }
WsTextListApp class >> rootComponentClass [

	^WsTextListComponent 
]

{ #category : #rendering }
WsTextListApp class >> title [

	<pharoJsSkip>
	^ 'Robots - Text List WebST Example'
]

{ #category : #initialization }
WsTextListApp >> initRootComponent [

	self rootComponent addAllTexts:
		#( 'Astro' 'Baymax' 'Chappie' 'Johnny-5' 'R2D2' 'Wall-E' )
]
