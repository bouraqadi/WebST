Class {
	#name : 'WsResourceFolderTest',
	#superclass : 'TestCase',
	#instVars : [
		'resourceFolder'
	],
	#category : 'WebST-Tests-Resources',
	#package : 'WebST-Tests',
	#tag : 'Resources'
}

{ #category : 'tests' }
WsResourceFolderTest >> assertFullPathFrom: relativePath [

	| rootPath actualPath |
	rootPath := resourceFolder rootPath.
	actualPath := resourceFolder fullPathFrom: relativePath.
	self assert: (actualPath beginsWith: rootPath).
	self assert: (actualPath endsWith: relativePath).
	self deny: (actualPath includesSubstring: '//')
]

{ #category : 'tests' }
WsResourceFolderTest >> assertPathToResources [

	{ ''. '/'. 'image.jpg'. '/sound.mp3'. 'my/js/folder/lib.js'.
	'/path/with/leading/slash/' } do: [ :each |
		self assertFullPathFrom: each ]
]

{ #category : 'tests' }
WsResourceFolderTest >> assertRootPath: path [

	| actualPath |
	actualPath := resourceFolder rootPath.
	self deny: actualPath isNil.
	self deny: actualPath isEmpty.
	self assert: (actualPath beginsWith: path).
	self assert: actualPath last equals: $/.
	self assertPathToResources
]

{ #category : 'tests' }
WsResourceFolderTest >> setUp [
	super setUp.
	resourceFolder := WsResourceFolder new
]

{ #category : 'tests' }
WsResourceFolderTest >> testCustomRootPath [

	#( '' '.' '..' 'some/path/' '/path/not/ending/with/slash' ) do: [
		:path |
		resourceFolder rootPath: path.
		self assertRootPath: path ]
]

{ #category : 'tests' }
WsResourceFolderTest >> testDefaultRootPath [

	self assertRootPath: WsResourceFolder defaultRootPath.

]

{ #category : 'tests' }
WsResourceFolderTest >> testLocalResourceUrl [

	| path resource |
	path := 'path/to/css/theme.css'.
	resource := WsCssLink url: path.
	self assert: resource url equals: (resourceFolder fullPathFrom: path)
]

{ #category : 'tests' }
WsResourceFolderTest >> testRemoteResourceUrl [
	| url resource |
	url := 'http://some.site.com/path/to/css/theme.css'.
	resource := WsCssLink url: url.
	self assert: resource url equals: url
]
