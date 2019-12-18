## XSLT transformation EAD into XML/RDF
We use XMLint to convert an example EAD file into RDF

Usage examples:
```
xsltproc ead2rico.xslt 30157-9.ead.xml > 30157-9.rdf.xml
```

## Test RDF-syntax
We test the resulting XML/RDF by parsing it with raptor.

Usage example
```
rapper -o turtle 30157-9.rdf.xml > 30157-9.ttl
```
