Class {
	#name : 'WsCompositeInitSubView',
	#superclass : 'WsView',
	#category : 'WebST-Examples-ViewCustomization',
	#package : 'WebST-Examples',
	#tag : 'ViewCustomization'
}

{ #category : 'rendering' }
WsCompositeInitSubView class >> subViewTextContent [
	^'Some text for sub view provided by composite'
]

{ #category : 'rendering' }
WsCompositeInitSubView >> renderOuterHtmlOn: html [

	html
		render: WsInitializableView
		with: [ :view | view textContent: self subViewTextContent ]
]

{ #category : 'rendering' }
WsCompositeInitSubView >> subViewTextContent [
	^self class subViewTextContent
]
