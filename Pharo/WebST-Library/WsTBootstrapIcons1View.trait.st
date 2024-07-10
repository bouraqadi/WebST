Trait {
	#name : #WsTBootstrapIcons1View,
	#category : #'WebST-Library-Bootstrap'
}

{ #category : #accessing }
WsTBootstrapIcons1View >> bootstrapIcons1Resources [

	^ { WsBootstrapResources bootstrapIcons1 }
]

{ #category : #rendering }
WsTBootstrapIcons1View >> renderOn: html icon: iconCssClass [

	^html icon class: ('bi ' , iconCssClass); yourself
]

{ #category : #accessing }
WsTBootstrapIcons1View >> resources [

	^self bootstrapIcons1Resources 
]
