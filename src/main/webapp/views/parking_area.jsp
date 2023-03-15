<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/views/includes/navbar.jsp" />

<%-- main start --%>
<!-- admin header start -->
<header>
  <div class="container">
    <div class="border-bottom pt-6">
      <div class="row align-items-center">
        <div class="col-sm col-12">
          <h1 class="h2 ls-tight">Parking Areas</h1>
        </div>
        <div class="col-sm-auto col-12 mt-4 mt-sm-0">
          <div class="hstack gap-2 justify-content-sm-end">
            <a
                    href="${pageContext.request.contextPath}/parking_area/new"
                    class="btn btn-sm btn-primary"
            >
                      <span class="pe-2">
                        <i class="bi bi-plus-square-dotted"></i>
                      </span>
              <span>Add Parking</span>
            </a>
          </div>
        </div>
      </div>
    </div>
  </div>
</header>
<!-- admin header end -->

<main class="py-6 bg-surface-secondary">
  <div class="container">
    <!-- latest bookings start -->
    <div class="card">
      <div class="card-header border-bottom">
        <h5 class="mb-0">Parking Areas</h5>
      </div>
      <div class="table-responsive">
        <table class="table table-hover table-nowrap">
          <thead class="table-light">
          <tr>
            <th scope="col">Name</th>
            <th scope="col">Capacity</th>
            <th scope="col">Location</th>
            <th scope="col">Price</th>
            <th scope="col">Status</th>
            <th scope="col">Fine</th>
            <th scope="col">Opening Time</th>
            <th scope="col">Closing Time</th>
            <th scope="col">Action</th>
            <th></th>
          </tr>
          </thead>
          <tbody>
          <c:if test="${parkingAreasList != null}">
            <c:forEach var="parkingArea" items="${parkingAreasList}">
              <tr>
                <td>
                  <img
                          alt="..."
                          src="${pageContext.request.contextPath}/uploads/${parkingArea.image}"
                          class="avatar avatar-sm rounded-circle me-2"
                  />
                  <a class="text-heading font-semibold" href="#">${parkingArea.name}</a>
                </td>
                <td>${parkingArea.capacity}</td>
                <td>${parkingArea.location}</td>
                <td>Ksh. ${parkingArea.price}<span class="text-xs text-muted">/ Hour</span></td>
                <td>
                  <c:choose>
                    <c:when test="${parkingArea.status eq 'Open'}">
          <span class="badge badge-lg badge-dot">
            <i class="bg-success"></i>
            ${parkingArea.status}
          </span>
                    </c:when>
                    <c:otherwise>
          <span class="badge badge-lg badge-dot">
            <i class="bg-danger"></i>
            ${parkingArea.status}
          </span>
                    </c:otherwise>
                  </c:choose>
                </td>
                <td>Ksh. ${parkingArea.fine}<span class="text-sm text-muted">/ Hour</span></td>
                <td>${parkingArea.openingTime}</td>
                <td>${parkingArea.closingTime}</td>
                <td>
                  <button class="btn btn-sm btn-outline-dark">
                    <i class="bi bi-pencil"></i>
                  </button>
                  <button class="btn btn-sm btn-outline-danger">
                    <i class="bi bi-trash"></i>
                  </button>
                </td>
              </tr>
            </c:forEach>
          </c:if>
          </tbody>
        </table>
      </div>
    </div>
    <!-- latest bookings end -->
  </div>
</main>
<%-- main end --%>

<jsp:include page="/views/includes/footer.jsp" />
