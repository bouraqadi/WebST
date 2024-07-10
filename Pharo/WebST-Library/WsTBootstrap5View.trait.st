Trait {
	#name : #WsTBootstrap5View,
	#category : #'WebST-Library-Bootstrap'
}

{ #category : #accessing }
WsTBootstrap5View >> bootstrap5Resources [

	^ { WsBootstrapResources bootstrap5 }
]

{ #category : #accessing }
WsTBootstrap5View >> resources [

	^ self bootstrap5Resources 
]
