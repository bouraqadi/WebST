Class {
	#name : 'WsTextListApp',
	#superclass : 'WsSingleComponentApp',
	#category : 'WebST-Examples-List',
	#package : 'WebST-Examples',
	#tag : 'List'
}

{ #category : 'rendering' }
WsTextListApp class >> rootComponentClass [

	^WsTextListComponent 
]

{ #category : 'rendering' }
WsTextListApp class >> title [

	<pharoJsSkip>
	^ 'Robots - Text List WebST Example'
]

{ #category : 'initialization' }
WsTextListApp >> initRootComponent [

	self rootComponent addAllTexts:
		#( 'Astro' 'Baymax' 'Chappie' 'Johnny-5' 'R2D2' 'Wall-E' )
]
