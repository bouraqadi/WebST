Trait {
	#name : #WsTBootstrapIcons1View,
	#category : #'WebST-Library-Bootstrap'
}

{ #category : #rendering }
WsTBootstrapIcons1View >> renderOn: html icon: iconCssClass [

	^html icon class: ('bi ' , iconCssClass); yourself
]

{ #category : #accessing }
WsTBootstrapIcons1View >> resources [

	^ {WsBootstrapResources bootstrapIcons1}
]
