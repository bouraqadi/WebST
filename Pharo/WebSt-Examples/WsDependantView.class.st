"
Example of a view that depends on some some resources
"
Class {
	#name : #WsDependantView,
	#superclass : #WsView,
	#category : #'WebSt-Examples-DependantViews'
}

{ #category : #rendering }
WsDependantView >> renderOuterHtmlOn: html [

	html paragraph: 'some text'
]

{ #category : #accessing }
WsDependantView >> resources [

	^ {
		  (WsCssLink url: 'requiredCSS').
		  (WsJsScript url: 'requiredJS') }
]
