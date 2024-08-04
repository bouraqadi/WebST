Trait {
	#name : 'WsTBootstrapIcons1View',
	#category : 'WebST-Library-Bootstrap',
	#package : 'WebST-Library',
	#tag : 'Bootstrap'
}

{ #category : 'accessing' }
WsTBootstrapIcons1View >> bootstrapIcons1Resources [

	^ { WsBootstrapResources bootstrapIcons1 }
]

{ #category : 'rendering' }
WsTBootstrapIcons1View >> renderOn: html icon: iconCssClass [

	^html icon class: ('bi ' , iconCssClass); yourself
]

{ #category : 'rendering' }
WsTBootstrapIcons1View >> renderOn: html icon: iconCssClass style: styleString [

	(self renderOn: html icon: iconCssClass) style: styleString 
]

{ #category : 'accessing' }
WsTBootstrapIcons1View >> resources [

	^self bootstrapIcons1Resources 
]
