FROM alpine
ADD fotu /
ADD /templates /templates
EXPOSE 3013
CMD ["/fotu"]
